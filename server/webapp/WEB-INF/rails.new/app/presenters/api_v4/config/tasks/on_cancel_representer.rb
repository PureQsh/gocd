##########################################################################
# Copyright 2016 ThoughtWorks, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################################################################

module ApiV4
  module Config
    module Tasks
      class OnCancelRepresenter < ApiV4::BaseRepresenter
        alias_method :on_cancel_config, :represented

        def from_hash(hash, options={})
          representer = TaskRepresenter.from_hash(hash, options)
          com.thoughtworks.go.config.OnCancelConfig.new(representer.task)
        end

        def to_hash(*options)
          return nil if on_cancel_config.getTask.getTaskType.eql?("killallchildprocess")
          TaskRepresenter.new(on_cancel_config.getTask).to_hash
        end
      end
    end
  end
end




